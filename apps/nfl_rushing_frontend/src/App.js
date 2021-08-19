import 'react-virtualized/styles.css'
import { useState, useEffect } from 'react'
import { Column, Table } from 'react-virtualized'

import "./App.css"
import { TableHeader } from './TableHeader'

const App = () => {
	const [playerRushingData, setPlayerRushingData] = useState([])

	const fetchPlayersData = async (sortBy) => {
		let url = "http://localhost:4000/api/player-rushing"


		if (sortBy) {
			url = `http://localhost:4000/api/player-rushing?sort_by=${sortBy}`
		}

		const response = await fetch(url)
		const { data } = await response.json()

		setPlayerRushingData(data)
	};

	const fetchOnePlayer = async (name) => {
		const response = await fetch(`http://localhost:4000/api/player-rushing/${name}`)
		const data = await response.json()

		setPlayerRushingData([data.player])
	}

	useEffect(() => {
		const loadData = async () => {
			await fetchPlayersData()
		}

		loadData()
	}, [])

	return (
		<>
			{playerRushingData.length === 0 ? (
				<p>Loading...</p>
			) : (
				<>
					<TableHeader fetchPlayersData={fetchPlayersData} fetchOnePlayer={fetchOnePlayer} />
					<Table
						width={1600}
						height={800}
						headerHeight={20}
						rowHeight={30}
						rowCount={playerRushingData.length}
						rowGetter={({ index }) => playerRushingData[index]}
					>
						<Column label="Name" dataKey="Player" width={200} />
						<Column label="Team" dataKey="Team" width={100} />
						<Column label="Position" dataKey="Pos" width={100} />
						<Column label="Att" dataKey="Att" width={100} />
						<Column label="Att/G" dataKey="Att/G" width={100} />
						<Column label="Yds" dataKey="Yds" width={100} />
						<Column label="Avg" dataKey="Avg" width={100} />
						<Column label="Yds/G" dataKey="Yds/G" width={100} />
						<Column label="TD" dataKey="TD" width={100} />
						<Column label="Lng" dataKey="Lng" width={100} />
						<Column label="1st" dataKey="1st" width={100} />
						<Column label="1st%" dataKey="1st%" width={100} />
						<Column label="20+" dataKey="20+" width={100} />
						<Column label="40+" dataKey="40+" width={100} />
						<Column label="FUM" dataKey="FUM" width={100} />
					</Table>
				</>
			)
			}
		</>
	)
}
export default App