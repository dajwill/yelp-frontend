<sample>
  <h1>Hello again from RiotJS!</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  </p>
  <div class="panel">
    <div class="panel-block" each={option in panelOptions}>{option}</div>
  </div>
  <pre>{search.filter}</pre>
  <button onclick="{updateSearch}" type="button" name="button">Button</button>
  <list search={search}/>

  <script type="text/javascript">
    require('./list.tag')
    import { store$, newSearch } from '../store'
    // this.search = {filter: ''}
    // console.log('searchFn', newSearch);

    this.panelOptions = [
      'Restaurants',
      'Bars',
      'Coffee Shops'
    ]

    this.updateSearch = () => {
      this.search.query = this.search.query === 'food' ? 'drinks' : 'food'
      newSearch(this.search)
    }
    store$.subscribe((state) => {
      this.update(state)
    })
  </script>

  <style type="scss">
  </style>
</sample>
