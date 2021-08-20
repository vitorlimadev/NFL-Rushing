import { createContext, useCallback, useState } from "react";

export const PlayersRushingContext = createContext({});

export const PlayersRushingProvider = ({ children }) => {
  const [playerRushingData, setPlayerRushingData] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchPlayersData = useCallback(async (sortBy) => {
    setLoading(true);
    let url = "http://localhost:4000/api/player-rushing";

    if (sortBy) {
      url = `http://localhost:4000/api/player-rushing?sort_by=${sortBy}`;
    }

    const response = await fetch(url);
    const { data } = await response.json();

    setPlayerRushingData(data);
    setLoading(false);
  }, []);

  const fetchOnePlayer = async (name) => {
    setLoading(true);
    const response = await fetch(
      `http://localhost:4000/api/player-rushing/${name}`
    );

    const json = await response.json();

    if (response.ok) {
      setPlayerRushingData([json.player]);
    } else {
      alert(json.message);
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
