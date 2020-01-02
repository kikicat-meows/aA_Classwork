export const fetchAllPokemon = () => {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};

export const fetchAPoke = (id) => {
  return $.ajax({
    url: `/api/pokemon/${id}`,
    method: 'GET'
  });
};