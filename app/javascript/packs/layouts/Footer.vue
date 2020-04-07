<template>
  <footer id="footer" class="text-white fixed-bottom p-3">
    <div class="d-flex justify-content-center">
      <form class="form-inline" @submit="addMinutes">
        <h5 id="add-minutes-text" class="mr-4">Add minutes to campaign</h5>
        <button id="add-minutes" type="submit" class="btn btn-light rounded-0">Proceed to Checkout</button>
      </form>
    </div>
  </footer>
</template>

<script>
import Dom from '../../src/dom/manipulator.js'

export default {
  name: 'Footer',
  mounted() {
    this.connect()
  },
  methods: {
    connect() {
      Dom.disable(document.getElementById('add-minutes'))
    },
    addMinutes(e) {
      e.preventDefault();
    }
  }
}
</script>

<style scoped>
  button[type="submit"]:hover{
    background-color: #fccc02
  }
</style>
