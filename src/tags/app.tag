<app>
  <home search={search} listings={listings} />

  <script type="text/javascript">
    require('./home.tag')
    import { store$, newSearch } from '../store'

    this.panelOptions = [
      'Restaurants',
      'Bars',
      'Coffee Shops'
    ]
    var self = this

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
