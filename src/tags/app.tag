<app>
  <div class="spinner" if={loading}>
    <div class="double-bounce1"></div>
    <div class="double-bounce2"></div>
  </div>
  <home if={view == 'home'} search={search} listings={listings} favorites={favorites} />
  <business if={view == 'business'} business={selected}/>
  <likes if={view == 'likes'} likes={favorites}/>
  <footer />

  <script type="text/javascript">
    require('./home.tag')
    require('./business.tag')
    require('./likes.tag')
    require('./footer.tag')
    import { store$, newSearch } from '../store'

    this.panelOptions = [
      'Restaurants',
      'Bars',
      'Coffee Shops'
    ]
    var self = this

    this.liked = (id) => this.favorites.filter(item => item.id === id).length

    store$.subscribe((state) => {
      console.log('state', state);
      this.update(state)
    })
  </script>

  <style scoped>
    .panel {
      font-size: 1.4rem;
    }
  </style>
</app>
