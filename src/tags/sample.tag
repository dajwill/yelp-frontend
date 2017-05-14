<sample>
  <nav class="panel">
    <div class="panel-block">
      <p class="control has-icons-left">
        <input class="input is-large" type="text" placeholder="Search" onkeyup={submit} onclick="{submit}">
        <span class="icon is-small is-left">
          <i class="fa fa-search"></i>
        </span>
      </p>
    </div>
    <div class="panel-block" each={option in panelOptions} onclick="{updateSearch('filter', option)}">
      <h1>{option}</h1>
    </div>

    <h1>Results</h1>
    <li each={listings}>{this.name}</li>
  </nav>

  <script type="text/javascript">
    require('./list.tag')
    import { store$, newSearch } from '../store'

    this.panelOptions = [
      'Restaurants',
      'Bars',
      'Coffee Shops'
    ]
    var self = this

    this.updateSearch = (type, value) => {
      return () => {
        this.search[type] = value
        newSearch(this.search)
      }
    }

    this.submit = (e) => {
      if (e.keyCode === 13) {
        this.search.query = e.target.value
        newSearch(this.search)
      }
    }

    store$.subscribe((state) => {
      console.log('state', state);
      this.update(state)
    })
  </script>

  <style type="scss">
    .panel {
      font-size: 1.4rem;
    }
  </style>
</sample>
