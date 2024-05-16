// src/components/IndexPage.js
import React from 'react';
import './IndexPage.css';
import hadoopIcon from '../assets/icons/hadoop-icon.png';
import sparkIcon from '../assets/icons/spark-icon.png';
import jupyterIcon from '../assets/icons/jupyter-icon.png';
import jenkinsIcon from '../assets/icons/jenkins-icon.png';
import serverIcon from '../assets/icons/server-icon.png';

function IndexPage() {
  const applications = [
    { name: 'Apache Hadoop', image: hadoopIcon, alt: 'Hadoop Icon', url: 'http://34.66.52.229:9870' },
    { name: 'Apache Spark', image: sparkIcon, alt: 'Spark Icon', url: 'http://34.170.65.170:8080' },
    { name: 'Jupyter Notebook', image: jupyterIcon, alt: 'Jupyter Icon', url: 'http://34.133.226.219:8888' },
    { name: 'Jenkins', image: jenkinsIcon, alt: 'Jenkins Icon', url: 'http://34.30.149.154:8080' }
  ];

  const handleAppClick = (url) => {
    window.open(url, '_blank');
  };

  return (
    <div className="index-page">
        <h1>Big Data Processing Toolbox</h1>
        <div className="server-image">
            <img src={serverIcon} alt="Server" />
        </div>
        <div className="applications">
            {applications.map((app) => (
            <div key={app.name} className="app-icon" onClick={() => handleAppClick(app.url)}>
            <img src={app.image} alt={app.alt} />
            <p>{app.name}</p>
            <button className="run-button">Run</button>
        </div>
        ))}
      </div>
    </div>
  );
}

export default IndexPage;
