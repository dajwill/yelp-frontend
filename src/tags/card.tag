<card>
  <div class="card item">
    <div class="card-image">
      <figure class="image is-3by2">
        <img src="{opts.item.image_url}" alt="Image" />
        <div class="favorite is-overlay is-pulled-right">
          <span class="is-pulled-right">
            <i if={!opts.liked} class="fa fa-heart-o like-button" aria-hidden="true" data-id="{this.id}" onclick="{handleLike}"></i>
            <i if={opts.liked} class="fa fa-heart like-button" aria-hidden="true" data-id="{this.id}" onclick="{handleLike}"></i>
          </span>
        </div>
      </figure>
    </div>
    <div class="card-content">
      <div class="media">
        <div class="media-content">
          <span class="content-heading">
            <span class="title is-5 business-name">{opts.item.name}</span>
            <rating score="{opts.item.rating}" />
          </span>
          <span class="distance">{miles(opts.item.distance)} mi</span>
        </div>
      </div>
      <div class="content sub-info">
        <span class="business-type">
          {opts.item.categories[0].title}
        </span>
        <span if={!opts.item.is_closed}>Open Now</span>
        <span>{opts.item.price}</span>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    import { updateView, updateLikes } from '../store'
    require('./rating.tag')

    this.updateView = (e) => {
      updateView('business')
    }

    this.handleLike = (e) => {
      e.stopPropagation()
      updateLikes(this.opts.item)
    }

    this.miles = (meters) => {
      let miles = meters*0.000621371192;
      return Math.round( miles * 100 ) / 100
    }
  </script>
</card>
