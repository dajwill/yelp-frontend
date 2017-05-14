<home>
  <nav class="panel">
    <div class="panel-block">
      <p class="control has-icons-left">
        <input class="input is-large" type="text" placeholder="Search" onkeyup={submit} onclick="{submit}">
        <span class="icon is-small is-left">
          <i class="fa fa-search"></i>
        </span>
      </p>
    </div>
    <div class="panel-block" each={option in panelOptions} onclick="{updateFilter(option.value)}">
      <h1>{option.label}</h1>
    </div>

    <h1 class="red">Results</h1>

    <div each={opts.listings}>
      <div class="card">
        <div class="card-image">
          <figure class="image is-3by2">
            <img src="{this.image_url}" alt="Image">
          </figure>
        </div>
        <div class="content">
          {this.name}
        </div>
      </div>
      <div class="rating rating-{score}">
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
      </div>

    </div>
  </nav>

  <script type="text/javascript">
    import { newSearch } from '../store'
    require('./rating.tag')
    console.log(this);
    this.search = this.opts.search
    this.listings = this.opts.listings

    this.panelOptions = [
      { label: 'Restaurants', value: 'restaurant' },
      { label: 'Bars', value: 'bars' },
      { label: 'Coffee Shops', value: 'coffeeshop' }
    ]

    this.updateFilter = (value) => {
      return () => {
        console.log(this.search);
        this.opts.search.filter = value
        newSearch(this.opts.search)
        this.update()
      }
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
