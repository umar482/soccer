import axios from 'axios'

const state = {
  games: []
}

const getters  = {
  allGames: (state) => state.games
}

const actions = {
  fetchGames({ commit }) {
    axios.get('games.json')
      .then(res => {
        commit('setGames', res.data)
      })
      .catch(err => {
        console.log(err)
      })
  },
  updateGame({ commit },updatedGame){
    axios({
      method: 'PUT',
      headers: { 'X-CSRF-Token': document.getElementsByName("csrf-token")[0].content },
      data: {minutes_bought: updatedGame.minutes_bought},
      url: `games/${updatedGame.id}.json`
    })
    .then(res => {
      commit('updateGame', res.data)
    })
    .catch(err => {
      console.log(err)
    }) 
  }
}

const mutations = {
  setGames: (state, games) => (state.games = games),
  updateGame: (state, updatedGame) => {
    const index = state.games.findIndex(game => game.id === updatedGame.id)
    if(index !== -1){
      state.games[index] = updatedGame
    }
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}