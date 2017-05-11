import { Subject, Observable } from 'rxjs/Subject'
import 'rxjs/add/operator/scan'
import 'rxjs/add/operator/startWith'
import axios from 'axios'

axios.defaults.headers.common['Authorization'] = 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'

const action$ = new Subject();

const initState = () => {
  return {
    search: {
      filter: 'all',
      query: '',
    },
    listings: [],
    favorites: []
  }
}

const reducer = (state, action) => {
  switch(action.type) {
    case 'UPDATE_SEARCH':
      return {
        ...state,
        search: action.payload
      };
    default:
      return state;
  }
}

const store$ = new Subject()
  .startWith(initState())
  .scan(reducer);

const actionDispatcher = (func) => (...args) =>
  action$.next(func(...args));

const newSearch = actionDispatcher((payload) => ({
  type: 'UPDATE_SEARCH',
  payload
}));

const fetchMusic = actionDispatcher((payload) => {
  return {
    type: 'FETCHING_RESULTS',
    payload: Observable.fromPromise(axios.get(`https://api.yelp.com/v3/businesses/search?location=48103`))
  }
})

export {
  store$,
  newSearch
}
