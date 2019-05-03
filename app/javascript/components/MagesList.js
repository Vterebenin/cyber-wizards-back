import React from "react"
import axios from 'axios';
import PropTypes from "prop-types"
class MagesList extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      mages: null,
    };
  }

  componentDidMount() {
    axios
      .get('/api/mages.json')
      .then((response) => {
        this.setState({ mages: response.data });
        console.log(response.data)
      })
      .catch((error) => {
        console.log(error);
      });
  }

  renderMages() {
    const { mages } = this.state;
    if (mages === null) return null;

    console.log(mages)
    return mages.map(mage => (
      <li key={mage.id}>
          {mage.name}
      </li>
    ));
    // return "123"
  }
  
  render () {
    return (
      <React.Fragment>
        123qwe
        <ul>{this.renderMages()}</ul>
      </React.Fragment>
    );
  }
}

MagesList.propTypes = {
  mages: PropTypes.arrayOf(PropTypes.object),
};

MagesList.defaultProps = {
  mages: [],
};
export default MagesList
