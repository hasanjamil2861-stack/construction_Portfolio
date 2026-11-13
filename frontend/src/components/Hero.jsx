import { useState, useEffect } from "react";
import { getData, UPLOADS_URL } from "../api/api";
import "@/css/Hero/Hero.css";

export default function Hero() {
  const [data, setData] = useState(null); // { hero, stats }

  // load hero + stats from the database
  useEffect(() => {
    getData("home.php").then(setData);
  }, []);

  // wait until data is loaded
  if (!data) return null;

  const { hero, stats } = data;

  return (
    <>
    <section
      id="home"
      className="hero"
      style={{ backgroundImage: `url(${UPLOADS_URL}/${hero.background_image})` }}
    >
      <div className="container">
        {/* text */}
        <div className="hero-content">
          <span className="hero-badge">
            <i className="bi bi-building"></i> {hero.badge_text}
          </span>

          <h1>
            {hero.title} <span>{hero.title_highlight}</span>
          </h1>

          <p>{hero.description}</p>

          {/* buttons */}
          <div className="hero-buttons">
            {hero.primary_btn_text && (
              <span className="btn btn-primary">{hero.primary_btn_text}</span>
            )}

            {hero.secondary_btn_text && (
              <span className="btn btn-outline-light">
                {hero.secondary_btn_text} <i className="bi bi-arrow-right"></i>
              </span>
            )}
          </div>
        </div>

        {/* orange stats bar */}
        <div className="hero-stats">
          {stats.map((stat) => (
            <div key={stat.id} className="hero-stat">
              <h3>{stat.number}{stat.suffix}</h3>
              <p>{stat.label}</p>
            </div>
          ))}
        </div>
      </div>
    </section>

    </>
  );
}