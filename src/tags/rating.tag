<rating>
  test
  <div class="rating rating-{score}">
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
  </div>

  <script type="text/javascript">
    this.score = Math.floor(this.opts.score)
    // console.log('opts', this.opts);
    // console.log('score', this.score);
  </script>

  <style>
    .dot {
      height: 10px;
      width: 10px;
      background-color: red;
      border-radius: 100%;
      margin: 2px;
    }

    .rating { display: inline-block; }

    /*.rating-1 {
      div:nth-child(-n+1){
        background-color: yellow;
      }
    }

    .rating-2 {
      div:nth-child(-n+2){
        background-color: yellow;
      }
    }

    .rating-3 {
      div:nth-child(-n+3){
        background-color: yellow;
      }
    }

    .rating-4 {
      div:nth-child(-n+4){
        background-color: yellow;
      }
    }

    .rating-5 {
      div:nth-child(-n+5){
        background-color: yellow;
      }
    }*/

  </style>
</rating>
