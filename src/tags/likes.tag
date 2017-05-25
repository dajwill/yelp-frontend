<likes>
  <nav class="panel" style="position:fixed;background-color:white;z-index:10;width:100vw;">
    <div class="panel-block">
      <p style="margin:0 auto;">Likes</p>
    </div>
  </nav >

  <div style="padding-top:60px;">
    <card each={opts.likes} item={this} />
  </div>
  <script type="text/javascript">
    require('./card.tag');
  </script>
</likes>
