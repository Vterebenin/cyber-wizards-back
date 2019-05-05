import React from "react"
import PropTypes from "prop-types"
class SearchForOponnent extends React.Component {
  render () {
    return (
      <React.Fragment>
        <button>
          Greeting: {this.props.greeting}
        </button>
      </React.Fragment>
    );
  }
}

SearchForOponnent.propTypes = {
  greeting: PropTypes.string
};
export default SearchForOponnent
