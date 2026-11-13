import { useState, useEffect } from "react";
import { getData, UPLOADS_URL } from "../api/api";
import "@/css/About/About.css";

export default function About() {
  const [data, setData] = useState(null); // { about, features }

  // load about text + features from the database
  useEffect(()=>{
    getData("about.php").then(setData);
  }, [])

  // wait until data is loaded
  if (!data) return null;

  const { about, features } = data;

  return (
    <>
    <section id="about" className="about">
      <div className="container about-inner">
        {/* left: images */}
        <div className="about-images">
          <img src={`${UPLOADS_URL}/${about.main_image}`} alt="" className="about-main" />
          <img src={`${UPLOADS_URL}/${about.secondary_image}`} alt="" className="about-secondary" />

          {/* orange circle */}
          {about.experience_number && (
            <div className="experience-badge">
              <strong>{about.experience_number}</strong>
              <span>{about.experience_label}</span>
            </div>
          )}
        </div>

        {/* right: text */}
        <div className="about-content">
          <span className="subtitle">
            <i className="bi bi-building"></i> {about.subtitle}
          </span>

          <h2>{about.title}</h2>
          <p className="about-text">{about.description}</p>

          {/* features 2x2 */}
          <div className="about-features">
            {features.map((feature) => (
              <div key={feature.id} className="feature">
                <span className="feature-icon">
                  <i className={`bi ${feature.icon}`}></i>
                </span>
                <h4>{feature.title}</h4>
                <p>{feature.description}</p>
              </div>
            ))}
          </div>

          {/* buttons  */}
          <div className="about-buttons">
            {about.primary_btn_text && (
              <span className="btn btn-primary">
                {about.primary_btn_text} <i className="bi bi-arrow-right"></i>
              </span>
            )}

            {about.secondary_btn_text && (
              <span className="btn btn-outline">{about.secondary_btn_text}</span>
            )}
          </div>
        </div>
      </div>
    </section>
    </>
  );
}