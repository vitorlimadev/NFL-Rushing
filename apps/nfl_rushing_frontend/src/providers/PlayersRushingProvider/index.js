import { createContext, useState } from "react";

export const PlayersRushingContext = createContext({});

export const PlayersRushingProvider = ({ children }) => {
  const [playerRushingData, setPlayerRushingData] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchPlayersData = async (sortBy) => {
    setLoading(true);
    let url = "http://localhost:4000/api/player-rushing";

    if (sortBy) {
      url = `http://localhost:4000/api/player-rushing?sort_by=${sortBy}`;
    }

    const response = await fetch(url);
    const { data } = await response.json();

    setPlayerRushingData(data);
    setLoading(false);
  };

  const fetchOnePlayer = async (name) => {
    setLoading(true);
    try {
      const response = await fetch(
        `http://localhost:4000/api/player-rushing/${name}`
      );
      const data = await response.json();

      setPlayerRushingData([data.player]);
    } catch (e) {
      setPlayerRushingData([]);
    }
    setLoading(false);
  };

  return (
    <PlayersRushingContext.Provider
      value={{
        fetchOnePlayer,
        fetchPlayersData,
        playerRushingData,
        loading,
      }}
    >
      {children}
    </PlayersRushingContext.Provider>
  );
};
