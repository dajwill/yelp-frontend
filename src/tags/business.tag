<business>
  <nav class="panel top-nav">
    <div class="panel-block">
      <a class="button is-outlined" onclick="{changeView}">< Back</a>
      <p class="business-name title is-4">{opts.business.name}</p>
    </div>
  </nav>

  <div class="padder"></div>

  <card item={opts.business} liked={liked(opts.business.id)} />

  <map coords={opts.business.coordinates} />

  <script type="text/javascript">
    import { updateView } from '../store'
    require('./map.tag')

    this.changeView = (e) => updateView('home')
    this.liked = (id) => this.opts.favorites.filter(item => item.id === id).length
  </script>
</business>
