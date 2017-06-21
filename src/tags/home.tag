<home>
  <nav class="panel top-nav">
    <div class="panel-block">
      <p class="control has-icons-left">
        <input class="input is-medium search-box"
          type="text"
          placeholder="Search"
          onkeyup={submit}
          onchange={updateSearch}
          value="{search.query}"
        >
        <span class="icon is-small is-left">
          <i class="fa fa-search"></i>
        </span>
      </p>
    </div>
    <div class="panel-block" each={option in panelOptions} onclick="{updateFilter(option.value)}">
      <p class="subtitle is-4">{option.label}</p>
    </div>
  </nav>

  <div class="result-list">
    <div class="list columns">
      <div each={opts.listings} class="column is-one-third">
        <card item={this} liked={liked(this.id)} onclick="{expand}"/>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    import { newSearch, updateLikes, updateView, expandBusiness } from '../store'
    require('./card.tag')

    this.on('mount', () => {
      if (!opts.listings.length) {
        console.log('loading..');
        newSearch(opts.search)
      }
    })

    this.search = this.opts.search
    this.listings = this.opts.listings
    this.opts.listings.map((item, index) => {
      if (index === 0) item.poop = true
    })

    this.expand = (e) => expandBusiness(e.item)

    this.panelOptions = [
      { label: 'Restaurants', value: 'restaurants' },
      { label: 'Bars', value: 'bars' },
      { label: 'Coffee Shops', value: 'coffee' }
    ]

    this.liked = (id) => this.opts.favorites.filter(item => item.id === id).length

    this.updateFilter = (value) => {
      return () => {
        this.opts.search.filter = value
        newSearch(this.opts.search)
        this.update()
      }
    }

    this.updateSearch = (e) => {
      this.search.query = e.target.value
      this.update()
    }

    this.submit = (e) => {
      if (e.keyCode === 13) {
        this.search.query = e.target.value
        newSearch(this.search)
      }
    }
  </script>
</home>
