<template>
  <section class="container">
    <div>
      <h2 class="subtitle">TODO Application</h2>

      <div class="state-box">
        <h3 class="todotitle">TODO</h3>

        <div class="card" style="width: 20rem;" v-for="item in todoItems">
          <div class="card-container">
            <h4 class="card-title">{{item.title}}</h4>
            <p>{{item.content}}</p>
            <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
          </div>
        </div>

        <div class="card" style="width: 20rem;">
          <div class="card-container">
            <input type="text">
            <textarea></textarea>
          </div>
        </div>
      </div>

      <div class="state-box">
        <h3 class="todotitle">PROGRESS</h3>

        <div class="card" style="width: 20rem;" v-for="item in progressItems">
          <div class="card-container">
            <h4 class="card-title">{{item.title}}</h4>
            <p>{{item.content}}</p>
            <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
          </div>
        </div>
      </div>

      <div class="state-box">
        <h3 class="todotitle">DONE</h3>

        <div class="card" style="width: 20rem;" v-for="item in doneItems">
          <div class="card-container">
            <h4 class="card-title">{{item.title}}</h4>
            <p>{{item.content}}</p>
            <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
          </div>
        </div>
      </div>

    </div>
  </section>
</template>

<script>
import axios from 'axios'

let todoApiUrl = process.env.TODO_API_URL || 'http://localhost:8000'

export default {
  async asyncData (context) {
    const { data: todoItems } = await axios.get(`${todoApiUrl}/todo?status=TODO`)
    const { data: progressItems } = await axios.get(`${todoApiUrl}/todo?status=PROGRESS`)
    const { data: doneItems } = await axios.get(`${todoApiUrl}/todo?status=DONE`)
    return {
      todoItems,
      progressItems,
      doneItems
    }
  }
}
</script>

<style>
.container {
  min-height: 100vh;
  display: flex;
  padding: 2vh;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.state-box {
  float: left;
}

.todotitle {
  font-weight: 300;
  font-size: 20px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}

.card {
  border-radius: 5px;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  background-color: #ccccff;
  margin: 10px;
}

.card-title {
  margin-bottom: .75rem;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.card-container {
  padding: 2px 16px;
}
</style>
