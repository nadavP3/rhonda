class Answer extends React.Component {
  componentDidMount() {
    $('html, body').animate({
      scrollTop: $('.clearfix').offset().top
    }, 'slow');
  }
  render() {
    if (this.props.link.length > 0) {
      return(
        <div>
          <div className="message-data ">
            <span className="message-data-name"><i className="fa fa-circle you"></i> Rhonda</span>
          </div>
          <div className="message you-message">
            {this.props.answer} <p> </p>
            <a href={this.props.link} target="_blank"> More info.</a>
          </div>
        </div>
      )
    } else if (this.props.giph.length > 0) {
      return(
        <div>
          <div className="message-data ">
            <span className="message-data-name"><i className="fa fa-circle you"></i> Rhonda</span>
          </div>
          <div className="message you-message">
            <img className="img-size" src={this.props.giph} />
          </div>
        </div>
      )
    } else {
    return(
      <div>
        <div className="message-data ">
          <span className="message-data-name"><i className="fa fa-circle you"></i> Rhonda</span>
        </div>
        <div className="message you-message">
          {this.props.answer}
        </div>
      </div>
    )
    }
  }
}
