import { Subject, Observable } from 'rxjs'
import 'rxjs/add/operator/scan'
import 'rxjs/add/operator/startWith'
import 'rxjs/add/operator/catch'
import 'rxjs/add/observable/throw'
import axios from 'axios'

axios.defaults.headers.common['Authorization'] = 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'

const action$ = new Subject();

const initState = {
  search: {
    filter: 'food,bars',
    query: '',
    recommended: true
  },
  listings: [],
  favorites: [],
  view: 'home',
  selected: null
}

const reducer = (state, action) => {
  switch(action.type) {
    case 'FETCHING_RESULTS':
      return {
        ...state,
        loading: true,
        search: action.payload
      };
    case 'RESULTS_LOADED':
      return {
        ...state,
        loading: false,
        listings: action.payload
      }
    case 'UPDATE_FAVORITE':
      let index = state.favorites.indexOf(action.payload)
      index >= 0 ? state.favorites.splice(index, 1) : state.favorites.push(action.payload)
      return {
        ...state,
        favorites: state.favorites
      }
    case 'UPDATE_VIEW':
      return {
        ...state,
        loading: false,
        view: action.payload
      }
    case 'SELECT_BUSINESS':
      return {
        ...state,
        view: 'business',
        selected: action.payload
      }
    case 'ERROR':
      return {
        ...state,
        loading: false,
        error: action.payload
      }
    default:
      return state;
  }
}

const store$ = action$
  .startWith(initState)
  .scan(reducer);

const actionDispatcher = (func) => (...args) => {
  return action$.next(func(...args))
}

const actionCreator = (func) => (...args) => {
  const action = func.call(null, ...args);
  action.subscribe((next) => {
    return action$.next(next)
  })
};

const newSearch = actionCreator((payload) => {
  console.log(payload);
  let { filter, query } = payload
  return Observable.ajax(`https://daj-yelp-server.herokuapp.com/search?filter=${filter}&query=${query}`)
    .map(e => e.response)
    .map(businesses => ({
      type: 'RESULTS_LOADED',
      payload: businesses
    }))
    .catch(error => Observable.of(error)
      .mapTo({
        type: 'ERROR',
        payload: error
      })
    )
    .startWith({ type: 'FETCHING_RESULTS', payload: payload })
});

const updateLikes = actionDispatcher((payload) => ({
  type: 'UPDATE_FAVORITE',
  payload
}))

const updateView = actionDispatcher((payload) => ({
  type: 'UPDATE_VIEW',
  payload
}))

const expandBusiness = actionDispatcher((payload) => ({
  type: 'SELECT_BUSINESS',
  payload
}))

export {
  store$,
  newSearch,
  updateLikes,
  updateView,
  expandBusiness
}
