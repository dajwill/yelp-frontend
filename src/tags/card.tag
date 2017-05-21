<card>
  <div class="card item">
    <div class="card-image">
      <figure class="image is-3by2">
        <img src="{opts.item.image_url}" alt="Image" />
        <div class="favorite is-overlay is-pulled-right">
          <span class="is-pulled-right">
            <i if={!opts.liked} class="fa fa-heart-o" style="color: white;font-size:2rem;padding:10px;" aria-hidden="true" data-id="{this.id}" onclick="{handleLike}"></i>
            <i if={opts.liked} class="fa fa-heart" style="color: white;font-size:2rem;padding:10px;" aria-hidden="true" data-id="{this.id}" onclick="{handleLike}"></i>
          </span>
        </div>
      </figure>
    </div>
    <div class="card-content" style="font-size:1rem;">
      <div class="columns is-mobile">
        <div class="column is-half business-name">
          {opts.item.name}
        </div>
        <div class="column">
          <rating score="{opts.item.rating}" />
        </div>
        <div class="column">
          <span class="is-pulled-right">{miles(opts.item.distance)} mi</span>
        </div>
      </div>
      <div class="columns is-mobile">
        <div class="column is-third business-type">
          {opts.item.categories[0].title}
        </div>
        <div class="column">
          <span class="is-pulled-right" if={!opts.item.is_closed}>Open Now</span>
        </div>
        <div class="column">
          <span class="is-pulled-right">{opts.item.price}</span>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    import { updateView, updateLikes } from '../store'
    require('./rating.tag')
    console.log(this.opts);

    this.updateView = (e) => {
      updateView('business')
    }

    this.handleLike = (e) => {
      e.stopPropagation()
      updateLikes(e.item)
      // setLiked
    }

    this.miles = (meters) => {
      let miles = meters*0.000621371192;
      return Math.round( miles * 100 ) / 100
    }
  </script>
</card>
