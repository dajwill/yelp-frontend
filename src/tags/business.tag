<business>
  <nav class="panel" style="position:fixed;background-color:white;z-index:10;width:100vw;">
    <div class="panel-block">
      <a class="button is-outlined" onclick="{changeView}" style="margin-right:10px;">< Back</a>
      <p class="business-name">{opts.business.name}</p>
    </div>

    <card item={opts.business}/>

    <map coords={opts.business.coordinates} />
    map

  </nav>
  <script type="text/javascript">
    import { updateView } from '../store'
    require('./map.tag')
    this.changeView = (e) => updateView('home')
  </script>
</business>
