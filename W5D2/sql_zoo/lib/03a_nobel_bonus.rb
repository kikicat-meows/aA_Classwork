# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  # select yr
  # from nobels c
  # where c.subject = 'Chemistry'
  # and c.yr not in
  # (select yr from nobels p where p.subject = 'Physics');
  execute(<<-SQL)

  select distinct yr
  from nobels p
  where p.subject = 'Physics'
  and p.yr not in
  (select yr from nobels c where c.subject = 'Chemistry');

  SQL
end
