require "sqlite3"
require "singleton"

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    Users.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    Users.new(data.first)
  end

  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

end

class Questions

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Questions.new(data.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    Questions.new(data.first)
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  attr_accessor :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    Users.find_by_id(author_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end
end

class Replies

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    raise "No reply associated with ID entered" if data.empty?

    Replies.new(data.first)
  end

  def self.find_by_user_id(author_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    raise "That user did not reply to anything" if data == []
    Replies.new(data.first)
  end

  def self.find_by_question_id(subject)
    data = QuestionsDBConnection.instance.execute(<<-SQL, subject)
      SELECT
        *
      FROM
        replies
      WHERE
        subject = ?
    SQL
    raise "That question id doesn't exist" if data.empty?

    data.map { |datum| Replies.new(datum) }
  end

  attr_accessor :subject, :parent_reply, :body, :author_id

  def initialize(options)
    @id = options['id']
    @subject = options['subject']
    @parent_reply = options['parent_reply']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    Users.find_by_id(author_id)
  end

  def question
    Questions.find_by_id(subject)
  end

  def parent_reply
    if !@parent_reply.nil?
      Replies.find_by_id(@parent_reply)
    else
      raise "No parent reply"
    end 
  end

  def child_replies
    replies = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply = ?
    SQL

    raise "no child replies" if replies.empty?
    replies.map { |reply| Replies.new(reply) }
  end
end

class QuestionFollows

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    QuestionFollows.new(data.first)
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        u.id,
        u.fname,
        u.lname
      FROM users u JOIN question_follows q ON u.id = q.follower_id
      WHERE q.question_id = ?
    SQL
    raise "Question has no followers" if data.empty?
    data.map {|datum| Users.new(datum)}
    # data = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
    #   SELECT
    #     follower_id
    #   FROM
    #     question_follows
    #   WHERE
    #     question_id = ?
    # SQL
    # raise "Question has no followers" if data.empty?

    # data.map(&:values).map { |datum| Users.find_by_id(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
    SELECT
      q.*
    FROM
      question_follows qf JOIN questions q ON qf.question_id = q.id
    WHERE
      qf.follower_id = ?
    SQL

    raise "No questions associated with ID" if data.empty?
    
    data.map { |datum| Questions.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        q.title,
        q.body,
        q.id,
        q.author_id,
        COUNT(*)
      FROM
        question_follows qf JOIN questions q ON qf.question_id = q.id
      GROUP BY 
        1,2,3,4
      ORDER BY COUNT(*) DESC
      LIMIT ?
    SQL
    data.map {|datum| Questions.new(datum)}
  end

  attr_accessor :question_id, :follower_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @follower_id = options['follower_id']
  end
end

class QuestionLikes

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    QuestionLikes.new(data.first)
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT u.id, u.fname, u.lname
      FROM question_likes ql JOIN users u ON ql.like_user_id = u.id
      WHERE ql.question_id = ?
    SQL
    raise "No one liked this question" if data.empty?
    
    data.map {|datum| Users.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    count_hash = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
    SELECT count(*)
    FROM question_likes
    WHERE question_id = ?
    SQL
    count = count_hash.map(&:values).flatten
    raise "Nobody likes this question" if count.first == 0
    count.first
  end

  attr_accessor :question_id, :like_user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @like_user_id = options['like_user_id']
  end
end