<template>
  <div id="game-list" class="mx-5 my-4 overflow-auto vh-100">
    <div :key="game.id" v-for="game in games">
      <Game :game="game"/>
    </div>
  </div>
</template>

<script>
import Game from './Game.vue'
export default {
  name: 'GameList',
  components: {
    Game
  },
  props: ['games']
}
</script>

<style scoped>

</style>
