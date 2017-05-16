<home>
  <nav class="panel" style="position:fixed;background-color:white;z-index:10;margin-top:-10px;width:100vw;">
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
  <div class="list" style="z-index:-10;padding-top:250px;">
    <div each={opts.listings}>
      <div class="card item">
        <div class="card-image">
          <figure class="image is-3by2">
            <img src="{this.image_url}" alt="Image" />
            <div class="favorite is-overlay is-pulled-right">
              <span class="is-pulled-right">
                <i class="fa fa-heart-o" style="color: white;font-size:2rem;padding:10px;" aria-hidden="true" data-id="{this.id}" onclick="{handleLike}"></i>
              </span>
            </div>
          </figure>
        </div>
        <div class="card-content" style="font-size:1rem;">
          <div class="columns is-mobile">
            <div class="column is-half business-name">
              {this.name}
            </div>
            <div class="column">
              <rating score="{this.rating}" />
            </div>
            <div class="column">
              {miles(this.distance)} mi
            </div>
          </div>
          <div class="columns is-mobile">
            <div class="column">
              {this.categories[0].title}
            </div>
            <div class="column">
              <span if={!this.is_closed}>Open Now</span>
            </div>
            <div class="column">
              {this.price}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

    <div class="panel" style="position:fixed;bottom:0;background-color:white;z-index:10;width:100vw;">
      <div class="panel-tabs" style="justify-content:space-around;">
        <a class="is-active">
          <i class="fa fa-search" style="color:#E4BA8E;font-size:1.5rem;"></i>
        </a>
        <a><i class="fa fa-compass" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
        <a><i class="fa fa-heart-o" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
        <a><i class="fa fa-user-o" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
      </div>
    </div>

  <script type="text/javascript">
    import { newSearch, updateLikes } from '../store'
    require('./rating.tag')
    console.log(this);
    this.search = this.opts.search
    this.listings = this.opts.listings

    this.panelOptions = [
      { label: 'Restaurants', value: 'restaurants' },
      { label: 'Bars', value: 'bars' },
      { label: 'Coffee Shops', value: 'coffee' }
    ]

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

    this.handleLike = (e) => updateLikes(e.item.id)

    this.miles = (meters) => {
      let miles = meters*0.000621371192;
      return Math.round( miles * 100 ) / 100
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
