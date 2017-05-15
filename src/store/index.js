import { Subject, Observable } from 'rxjs'
import 'rxjs/add/operator/scan'
import 'rxjs/add/operator/startWith'
import 'rxjs/add/operator/catch'
import 'rxjs/add/observable/throw'
import axios from 'axios'

axios.defaults.headers.common['Authorization'] = 'Bearer eGuwe0MktbhJHGhC9kOFgU3mC216qfQiIal1yJLIiCvQ0EbYYPRHiqQiW0qTdLqp3yY6hfpezmzGCfstpYHj673diAToRut3tVyUSfNN0-1QOYxA4qg8rLXpuLwPWXYx'

const action$ = new Subject();

const initState = () => {
  return {
    search: {
      filter: 'all',
      query: 'food',
    },
    listings: [],
    favorites: []
  }
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
        listings: action.payload
      }
    case 'UPDATE_FAVORITE':
      if (state.favorites.includes(action.payload)) {
        let index = state.favorites.indexOf(action.payload)
        state.favorites.splice(index, 1)
        var newFaves = state.favorites
      } else {
        var newFaves = state.favorites.concat(action.payload)
      }

      return {
        ...state,
        favorites: newFaves
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
  .startWith(initState())
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

// const newSearch = actionDispatcher((payload) => ({
//   type: 'UPDATE_SEARCH',
//   payload
// }));

const newSearch = actionCreator((payload) => {
  console.log(payload);
  let { filter, query } = payload
  return Observable.ajax(`http://localhost:8081/search?filter=${filter}&query=${query}`)
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

export {
  store$,
  newSearch,
  updateLikes
}
