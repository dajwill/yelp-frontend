<footer>
  <div class="panel bottom-nav">
    <div class="panel-tabs" style="justify-content:space-around;">
      <a class="is-active">
        <i onclick="{changeView}" data-route="home" class="fa fa-search" style="color:#E4BA8E;font-size:1.5rem;"></i>
      </a>
      <a><i class="fa fa-compass" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
      <a><i onclick="{changeView}" data-route="likes" class="fa fa-heart-o" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
      <a><i class="fa fa-user-o" style="color:#E4BA8E;font-size:1.5rem;"></i></a>
    </div>
  </div>

  <script type="text/javascript">
    import { updateView } from '../store'
    this.changeView = (e) => {
      console.log(e);
      updateView(e.target.dataset.route)
    }
  </script>
</footer>
