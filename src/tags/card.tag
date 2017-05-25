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
      <div class="media">
        <div class="media-content" style="display:flex;justify-content:space-between;">
          <span style="align-self:center;padding:5px 0;">
            <span class="title is-5 business-name">{opts.item.name}</span>
            <rating style="display:inline-block;padding:0 5px;" score="{opts.item.rating}" />
          </span>
          <span class="" style="align-self:center;justify-content:flex-end;">{miles(opts.item.distance)} mi</span>
        </div>
      </div>
      <div class="content" style="display:flex;justify-content:space-between;">
        <span class="business-type" style="flex-basis:50%;">
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
