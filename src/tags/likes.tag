<likes>
  <nav class="panel top-nav">
    <div class="panel-block">
      <p class="title is-4 centered">Likes</p>
    </div>
  </nav >

  <div class="padder"></div>

  <card each={opts.likes} item={this} liked={true} />

  <script type="text/javascript">
    require('./card.tag');
  </script>
</likes>
