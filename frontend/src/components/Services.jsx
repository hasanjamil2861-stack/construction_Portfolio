import { useState, useEffect } from "react";
import { getData, UPLOADS_URL } from "@/api/api";
import "@/css/Services/Services.css";

export default function Services() {
  const [data, setData] = useState(null); // { section, services, trackRecord, trackStats }

  // load services + track record from the database
  useEffect(() => {
    getData("services.php").then(setData);
  }, []);

  // wait until data is loaded
  if (!data) return null;

  const { section, services, trackRecord, trackStats } = data;

  return (
    <>
      {/* ===== Our Services ===== */}
      <section id="services" className="services">
        <div className="container">
          <div className="section-title">
            <h2>{section.title}</h2>
            <p>{section.subtitle}</p>
          </div>

          <div className="services-grid">
            {/* image card (tall, first column) */}
            <div
              className="services-card"
              style={{ backgroundImage: `url(${UPLOADS_URL}/${section.card_image})` }}
            >
              <h3>{section.card_title}</h3>
              {section.card_link_text && (
                <span className="services-card-link">
                  {section.card_link_text} <i className="bi bi-arrow-right"></i>
                </span>
              )}
            </div>

            {/* services list */}
            {services.map((service) => (
              <div key={service.id} className="service-item">
                <span className="service-icon">
                  <i className={`bi ${service.icon}`}></i>
                </span>
                <div>
                  <h4>{service.title}</h4>
                  <p>{service.description}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ===== Our Track Record ===== */}
      <section className="track-record">
        <div className="container track-inner">
          {/* left: text */}
          <div className="track-content">
            <span className="subtitle">{trackRecord.subtitle}</span>
            <h2>{trackRecord.title}</h2>
            <p>{trackRecord.description}</p>
            {trackRecord.link_text && (
              <span className="track-link">
                {trackRecord.link_text} <i className="bi bi-arrow-right"></i>
              </span>
            )}
          </div>

          {/* right: stats 2x2 */}
          <div className="track-stats">
            {trackStats.map((stat) => (
              <div key={stat.id} className="track-stat">
                <span className="track-icon">
                  <i className={`bi ${stat.icon}`}></i>
                </span>
                <div>
                  <h3>{stat.number}{stat.suffix}</h3>
                  <p>{stat.label}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}