<business>
  <nav class="panel" style="position:fixed;background-color:white;z-index:10;margin-top:-10px;width:100vw;">
    <div class="panel-block">
      <p onclick="{changeView}">< Back</p>
    </div>

    <card item={opts.business}/>

  </nav>
  <script type="text/javascript">
    import { updateView } from '../store'
    this.changeView = (e) => updateView('home')
  </script>
</business>
