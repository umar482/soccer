<template>
  <div id="game">
    <div :id="'game'+game.id" class="row d-flex align-items-center border-bottom px-2 py-4 bg-light game">
      <div class="logo col-lg-2 text-center">
        <img class="team-logo m-2" :src="require('../../../assets/images/'+game.home_team_logo)" width="50" height="50" alt="">
        <img class="team-logo m-2" :src="require('../../../assets/images/'+game.away_team_logo)" width="50" height="50" alt="">
      </div>
      <div class="name col-lg-3 text-center text-uppercase">
        <span class="p-2">{{game.home_team_name}}</span>-
        <span class="p-2">{{game.away_team_name}}</span>
        <br />
        <span class="p-2 small text-muted">{{ formattedDate(game.date) }}</span>
      </div>
      <div class="reach col-lg-1 text-center text-capitalize">
        <span class="p-2">{{game.reach}}</span>
        <br>
        <span class="p-2 small text-muted">reach</span>
      </div>
      <div class=" channel col-lg-2 text-center text-capitalize">
        <span class="p-2">{{game.channel}}</span>
        <br>
        <span class="p-2 small text-muted">channel</span>
      </div>
      <div class="league col-lg-1 text-center text-capitalize">
        <span class="p-2">{{game.league}}</span>
        <br>
        <span class="p-2 small text-muted">league</span>
      </div>
      <div class="price col-lg-1 text-center">
        <span class="p-2 font-weight-bold text-success">${{game.price_per_minute}}/min</span>
      </div>
      <div class="minutes-booked col-lg-2 text-center">
        <div class="btn-group" role="group" aria-label="Basic example">
          <button @click="subtractMinutes" type="button" class="btn px-3" :value="game.id">
            <i class="fas fa-angle-down"></i>
          </button>
          <button id="minutes-bought" type="button" class="btn px-3">{{game.minutes_bought}}</button>
          <button @click="addMinutes" type="button" class="btn btn-secondary px-3" :value="game.id">
            <i class="fas fa-angle-up"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import axios from 'axios'
import Dom from '../../src/dom/manipulator.js'
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'Game',
  props: ['game'],
  methods: {
    ...mapActions(['updateGame']),
    formattedDate(date) {
      return moment(date).format('hh:mm MM-DD-YYYY') 
    },
    addMinutes(event) {
      if(this.totalMinutes() === 0) {
        this.animate()
      }
      var minutes = event.currentTarget.previousElementSibling
      Dom.html(minutes, parseInt(minutes.innerHTML)+1)
      Dom.enable(document.getElementById('add-minutes'))
      Dom.html(document.getElementById('add-minutes-text'), `${this.totalMinutes()} minutes added to campaign`)
      this.updatedGame(parseInt(minutes.innerHTML))
    },
    subtractMinutes(event) {
      var minutes = event.currentTarget.nextElementSibling
      if(minutes.innerHTML > 0){
        Dom.html(minutes, parseInt(minutes.innerHTML)-1)
        Dom.disable(document.getElementById('add-minutes'))
        if(this.totalMinutes() === 0){
          Dom.removeClass(document.getElementById('footer'), 'slide-up-animate')
        }
        Dom.html(document.getElementById('add-minutes-text'), "Add minutes to campaign")
        this.updatedGame(parseInt(minutes.innerHTML))
      }
    },
    updatedGame(minutes){
      const Game = {
        id: this.game.id,
        home_team_name: this.game.home_team_name,
        away_team_name: this.game.away_team_name,
        data: this.game.data,
        reach: this.game.reach,
        channel: this.game.channel,
        league: this.game.league,
        price_per_minute: this.game.price_per_minute,
        minutes_bought: minutes,
        home_team_logo: this.game.home_team_logo,
        away_team_logo: this.game.away_team_logo
      }
      this.updateGame(Game)
    },
    totalMinutes(){
      var totalMinutes = 0
      document.querySelectorAll('#minutes-bought').forEach(function(event){
        totalMinutes += parseInt(event.innerHTML)
      })
      return totalMinutes
    },
    animate(){
      Dom.addClass(document.getElementById('footer'), 'slide-up-animate')
    }
  }
}
</script>

<style scoped>

</style>
