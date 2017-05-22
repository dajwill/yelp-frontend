<home>
  <nav class="panel" style="position:fixed;background-color:white;z-index:10;width:100vw;">
    <div class="panel-block">
      <p class="control has-icons-left">
        <input class="input is-large" type="text" placeholder="Search" onkeyup={submit} onchange={updateSearch} value="{search.query}">
        <span class="icon is-small is-left">
          <i class="fa fa-search" style="color:#E4BA8E;font-size:1.5rem;"></i>
        </span>
      </p>
    </div>
    <div class="panel-block" each={option in panelOptions} onclick="{updateFilter(option.value)}">
      <h1>{option.label}</h1>
    </div>

  </nav>
  <div class="list" style="z-index:-10;padding-top:250px;padding-bottom:40px;">
    <div each={opts.listings}>
      <card item={this} liked={liked(this.id)} onclick="{expand}"/>
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
        console.log(this.search);
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

  <style scoped>
    .red { color: yellow !important; }
    .dot {
      height: 15px;
      width: 15px;
      background-color: grey;
      border-radius: 100%;
      margin: 2px;
    }

    .rating { display: block; }
  </style>
</home>
