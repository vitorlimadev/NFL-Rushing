import styled from "styled-components";
import { CSVLink } from "react-csv";

export const Container = styled.div`
  width: 1590px;
  padding: 20px 10px;
  display: flex;
`;

export const FilterContainer = styled.div`
  width: ${({ width }) => `${width}px`};
  display: flex;
  justify-content: space-between;
  align-content: center;
`;

export const Button = styled.button`
  margin-left: 20px;
  padding: 4px 15px;
  background-color: ${({ clear, selected }) =>
    selected ? "rgba(0, 120, 253, 0.75)" : "gray"};
  border-radius: 10px;
  border: none;
  color: white;
  cursor: pointer;
`;

export const DownloadCSVButton = styled(CSVLink)`
  margin-left: 20px;
  padding: 4px 15px;
  background-color: green;
  border-radius: 10px;
  border: none;
  color: white;
  cursor: pointer;
  text-decoration: none;
`;

export const Input = styled.input`
  border-radius: 10px;
  padding: 4px 8px;
  border: none;
`;

export const PlayerSearchBox = styled.span`
  display: flex;
  align-items: center;
`;
