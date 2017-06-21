<footer>
  <div class="panel bottom-nav">
    <div class="panel-tabs page-nav">
      <a><i onclick="{changeView}" data-route="home" class="fa fa-search page-icon"></i></a>
      <a><i class="fa fa-compass page-icon"></i></a>
      <a><i onclick="{changeView}" data-route="likes" class="fa fa-heart-o page-icon"></i></a>
      <a><i class="fa fa-user-o page-icon"></i></a>
    </div>
  </div>

  <script type="text/javascript">
    import { updateView } from '../store'
    this.changeView = (e) => {
      updateView(e.target.dataset.route)
    }
  </script>
</footer>
