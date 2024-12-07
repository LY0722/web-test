<template>
  <div id="app" class="wrap">
    <div class="top-title" @click="changeModeEvent">
      <span v-if="changeMode">简易版计算器   ⚈</span>
      <span v-else>高级版计算器   ⚆</span>
    </div>
    <div class="result">{{ current }}</div>
    <table v-if="changeMode">
      <tr class="first">
        <td v-on:click="press">C</td>
        <td v-on:click="press">☒</td>
        <td v-on:click="press">*</td>
        <td v-on:click="press">/</td>
      </tr>
      <tr>
        <td v-on:click="press">7</td>
        <td v-on:click="press">8</td>
        <td v-on:click="press">9</td>
        <td v-on:click="press" class="first">-</td>
      </tr>
      <tr>
        <td v-on:click="press">4</td>
        <td v-on:click="press">5</td>
        <td v-on:click="press">6</td>
        <td v-on:click="press" class="first">+</td>
      </tr>
      <tr>
        <td v-on:click="press">1</td>
        <td v-on:click="press">2</td>
        <td v-on:click="press">3</td>
        <td v-on:click="press" class="equal" rowspan="2">=</td>
      </tr>
      <tr>
        <td v-on:click="press" colspan="2">0</td>
        <td v-on:click="press">.</td>
      </tr>
    </table>
    <table v-else>
      <tr>
        <td v-on:click="press">sin</td>
        <td v-on:click="press">cos</td>
        <td v-on:click="press">tan</td>
        <td v-on:click="press">log</td>
      </tr>
      <tr>
        <td v-on:click="press">ln</td>
        <td v-on:click="press">x^</td>
        <td v-on:click="press">(</td>
        <td v-on:click="press">)</td>
      </tr>
      <tr>
        <td v-on:click="press">C</td>
        <td v-on:click="press">☒</td>
        <td v-on:click="press">*</td>
        <td v-on:click="press">/</td>
      </tr>
      <tr>
        <td v-on:click="press">7</td>
        <td v-on:click="press">8</td>
        <td v-on:click="press">9</td>
        <td v-on:click="press" class="first">-</td>
      </tr>
      <tr>
        <td v-on:click="press">4</td>
        <td v-on:click="press">5</td>
        <td v-on:click="press">6</td>
        <td v-on:click="press" class="first">+</td>
      </tr>
      <tr>
        <td v-on:click="press">1</td>
        <td v-on:click="press">2</td>
        <td v-on:click="press">3</td>
        <td v-on:click="press" class="equal" rowspan="2">=</td>
      </tr>
      <tr>
        <td v-on:click="press" colspan="2">0</td>
        <td v-on:click="press">.</td>
      </tr>
    </table>
  </div>
</template>

<style>
  body {
    background-color: #000;
  }

.wrap {
    position: absolute;
    top: 10px;
    right: 10px;
    bottom: 10px;
    left: 10px;
  }

.top-title {
    position: relative;
    width: 100%;
    height: 8vh;
    text-align: center;
    color: #fff;
    line-height: 8vh;
    font-size: 0.8rem;
  }

.result {
    position: relative;
    width: 100%;
    height: 16vh;
    border-radius: 5px;
    font-size: 45px;
    line-height: 16vh;
    text-align: right;
    white-space: nowrap;
    color: #333;
    background: linear-gradient(to bottom, #edefe0 45%, #babea2 80%);
  }

  table {
    width: 100%;
    margin: 10px auto;
  }

  td {
    height: 11vh;
    width: 25%;
    border-radius: 10px;
    text-align: center;
    line-height: 11vh;
    font-size: 0.8rem;
    cursor: pointer;
    color: #fff;
    background: #112232;
    box-shadow: inset 0 -15px 1px rgba(0, 0, 0, 0.25), inset 0 1px 1px rgba(255, 255, 255, 0.4), inset 0 6px 6px rgba(255, 255, 255, 0.25);
  }

.first td,
.first {
    background: #4A3B34;
  }

.equal {
    background: #ea6812;
  }

  td:hover {
    background-image: linear-gradient(red, yellow, blue);
    color: green;
  }
</style>

<script>
export default {
  data() {
    return {
      current: "",
      changeMode: true
    };
  },
  methods: {
    press(event) {
      const key = event.target.textContent;
      if (key === 'C') {
        this.current = '';
      } else if (key === '=') {
        if (this.current!= "") {
          try {
            this.current = eval(this.current);
          } catch (e) {
            alert("您输入的式子有误");
          }
        }
      } else if (key === '%') {
        this.current = this.current + "/100";
      } else if (key === '☒') {
        this.current = this.current.substring(0, this.current.length - 1);
      } else if (
        key!= "=" && key!= "C" && key!= "%" && key!= "☒" && key!= "sin" && key!= "cos" &&
        key!= "tan" &&
        key!= "log" &&
        key!= "ln" &&
        key!= "x^"
      ) {
        this.current += key;
      } else if (key ==='sin') {
        this.current += "Math.sin(";
      } else if (key === 'cos') {
        this.current += "Math.cos(";
      } else if (key === 'tan') {
        this.current += "Math.tan(";
      } else if (key === 'log') {
        this.current += "Math.log(";
      } else if (key === 'ln') {
        this.current += "Math.log("; // 自然对数在 JavaScript 中也是 Math.log，底数为 e
      } else if (key === 'x^') {
        this.current += "Math.pow(";
      } else if (key === '(') {
        this.current += "(";
      } else if (key === ')') {
        this.current += ")";
      }
    },
    changeModeEvent() {
      this.changeMode =!this.changeMode;
    }
  }
};
</script>