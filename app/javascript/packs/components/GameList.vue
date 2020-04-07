<template>
  <div id="game-list" class="mx-5 my-4 vh-100">
    <div :key="game.id" v-for="game in allGames">
      <Game :game="game"/>
    </div>
  </div>
</template>

<script>
import Game from './Game.vue'
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'GameList',
  components: {
    Game
  },
  methods: {
    ...mapActions(["fetchGames"])
  },
  computed: {
    ...mapGetters(["allGames"])
  },
  mounted() {
    this.fetchGames()
  }
}
</script>

<style scoped>

</style>
