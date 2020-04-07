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
          <button @click="subtractMinutes" type="button" class="btn px-3" :value="game.id">&#9207;</button>
          <button id="minutes-bought" type="button" class="btn px-3">{{game.minutes_bought}}</button>
          <button @click="addMinutes" type="button" class="btn btn-secondary px-3" :value="game.id">&#9206;</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'
import axios from 'axios'

export default {
  name: 'Game',
  props: ['game'],
  methods: {
    formattedDate(date) {
      return moment(date).format('hh:mm MM-DD-YYYY') 
    },
    addMinutes(event) {

      var minutes = event.currentTarget.previousElementSibling;
      minutes.innerHTML = ""+(parseInt(minutes.innerHTML)+1);
      axios({
        method: 'PUT',
        headers: { 'X-CSRF-Token': document.getElementsByName("csrf-token")[0].content },
        data: {minutes_bought: minutes.innerHTML},
        url: "/game/"+event.currentTarget.value+".json"
      })
      .then( response => {
        this.animate();
        this.enableCheckoutBtn();
        document.getElementById('add-minutes-text').innerHTML = this.totalMinutes()+" minutes added to campaign";
      })
      .catch( err => {
        console.log(error)
      })
    },
    subtractMinutes() {
      var minutes = event.currentTarget.nextElementSibling;
      if(minutes.innerHTML > 0){
        minutes.innerHTML = ""+(parseInt(minutes.innerHTML)-1)
        
        axios({
          method: 'PUT',
          headers: { 'X-CSRF-Token': document.getElementsByName("csrf-token")[0].content },
          data: {minutes_bought: minutes.innerHTML},
          url: "/game/"+event.currentTarget.value+".json"
        })
        .then( response => {
          this.disableCheckoutBtn();
          var footer = document.getElementById('footer');
          if(this.totalMinutes() === 0){
            footer.classList.remove('slide-up-animate');
          }
          document.getElementById('add-minutes-text').innerHTML = "add minutes to campaign"
        })
        .catch( err => {
          console.log(error)
        })
      }
    },
    totalMinutes(){
      var totalMinutes = 0
      document.querySelectorAll('#minutes-bought').forEach(function(event){
        totalMinutes += parseInt(event.innerHTML);
      });
      return totalMinutes;
    },
    animate(){
      var footer = document.getElementById('footer');
      footer.classList.add('slide-up-animate');
    },
    enableCheckoutBtn(){
      var checkoutBtn = document.getElementById('add-minutes');
      checkoutBtn.classList.remove('disabled');
      checkoutBtn.disabled = false;
    },
    disableCheckoutBtn(){
      var checkoutBtn = document.getElementById('add-minutes');
      checkoutBtn.classList.add('disabled');
      checkoutBtn.disabled = true;
    }
  }
}
</script>

<style scoped>

</style>
