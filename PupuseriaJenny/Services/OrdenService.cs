﻿using PupuseriaJenny.Models;
//using RestauranteAPI.DTOs;
using RestauranteGestion.Core.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PupuseriaJenny.Services
{
    public class OrdenService
    {
        private readonly DBOperacion _operacion;

        // Convertir DataTable a Lista de Ordenes
        public List<Ordenes> ConvertirDataTableALista(DataTable dt)
        {
            var listaOrdenes = new List<Ordenes>();

            foreach (DataRow row in dt.Rows)
            {
                listaOrdenes.Add(new Ordenes
                {
                    // Convertir IdOrden de manera segura, y manejar valores nulos.
                    IdOrden = row["idOrden"] != DBNull.Value ? Convert.ToInt32(row["idOrden"]) : 0,

                    // Manejar el estado de la orden, asignando un valor predeterminado si es nulo.
                    EstadoOrden = row["estadoOrden"] != DBNull.Value ? row["estadoOrden"].ToString() : string.Empty,

                    // Manejar el idMesa como un int? (nullable int).
                    IdMesa = Convert.ToInt32(row["idMesa"]),

                    // Manejar ClienteOrden de manera segura.
                    ClienteOrden = row["clienteOrden"] != DBNull.Value ? row["clienteOrden"].ToString() : string.Empty,

                    // Manejar la fecha de la orden de manera segura.
                    FechaOrden = row["fechaOrden"] != DBNull.Value ? Convert.ToDateTime(row["fechaOrden"]) : DateTime.MinValue,

                    // Manejar TipoOrden de manera segura.
                    TipoOrden = row["tipoOrden"] != DBNull.Value ? row["tipoOrden"].ToString() : string.Empty,

                    // Manejar ComentarioOrden de manera segura.
                    ComentarioOrden = row["comentarioOrden"] != DBNull.Value ? row["comentarioOrden"].ToString() : string.Empty
                });
            }

            return listaOrdenes;
        }
        public OrdenService()
        {
            _operacion = new DBOperacion();
        }

        public int Insertar(Ordenes ordenes)
        {
            int idOrden = -1;
            StringBuilder sentencia = new StringBuilder();
            sentencia.Append("INSERT INTO RG_Orden(idMesa, clienteOrden, fechaOrden, tipoOrden, estadoOrden, comentarioOrden) ");
            sentencia.Append("VALUES(@idMesa, @clienteOrden, @fechaOrden, @tipoOrden, @estadoOrden, @comentarioOrden);");
            sentencia.Append("SELECT LAST_INSERT_ID();"); // Consulta para obtener el último ID insertado
            try
            {
                var parametros = new Dictionary<string, object>
                {
                    { "@idMesa", ordenes.IdMesa == 0 ? DBNull.Value : (object)ordenes.IdMesa },
                    { "@clienteOrden", ordenes.ClienteOrden },
                    { "@fechaOrden", ordenes.FechaOrden.ToString("yyyy-MM-dd") },
                    { "@tipoOrden", ordenes.TipoOrden },
                    { "@estadoOrden", ordenes.EstadoOrden },
                    { "@comentarioOrden", ordenes.ComentarioOrden }
                };
                // Ejecutar la sentencia y capturar el ID insertado
                idOrden = _operacion.EjecutarSentenciaYObtenerID(sentencia.ToString(), parametros);
            }
            catch (Exception)
            {
                idOrden = -1;
            }

            return idOrden;
        }

        public bool Actualizar(Ordenes ordenes)
        {
            bool resultado = false;
            StringBuilder sentencia = new StringBuilder();
            sentencia.Append("UPDATE RG_Orden SET ");
            sentencia.Append("idMesa = @idMesa, ");
            sentencia.Append("clienteOrden = @clienteOrden, ");
            sentencia.Append("fechaOrden = @fechaOrden, ");
            sentencia.Append("tipoOrden = @tipoOrden, ");
            sentencia.Append("estadoOrden = @estadoOrden, ");
            sentencia.Append("comentarioOrden = @comentarioOrden ");
            sentencia.Append("WHERE idOrden = @idOrden;");

            try
            {
                var parametros = new Dictionary<string, object>
                {
                    { "@idMesa", ordenes.IdMesa },
                    { "@clienteOrden", ordenes.ClienteOrden },
                    { "@fechaOrden", ordenes.FechaOrden.ToString("yyyy-MM-dd") },
                    { "@tipoOrden", ordenes.TipoOrden },
                    { "@estadoOrden", ordenes.EstadoOrden },
                    { "@comentarioOrden", ordenes.ComentarioOrden },
                    { "@idOrden", ordenes.IdOrden }
                };

                if (_operacion.EjecutarSentencia(sentencia.ToString(), parametros) >= 0)
                {
                    resultado = true;
                }
            }
            catch (Exception)
            {
                resultado = false;
            }

            return resultado;
        }

        public bool Eliminar(int idOrden)
        {
            bool resultado = false;
            StringBuilder sentencia = new StringBuilder();
            sentencia.Append("DELETE FROM RG_Orden WHERE idOrden = @idOrden;");

            try
            {
                var parametros = new Dictionary<string, object>
                {
                    { "@idOrden", idOrden }
                };

                if (_operacion.EjecutarSentencia(sentencia.ToString(), parametros) >= 0)
                {
                    resultado = true;
                }
            }
            catch (Exception)
            {
                resultado = false;
            }

            return resultado;
        }
        public bool EstadoOrden(int idOrden, string estado)
        {
            string sentencia = "UPDATE RG_Orden SET estadoOrden = @estado WHERE idOrden = @idOrden;";
            var parametros = new Dictionary<string, object>
            {
                { "@estado", estado },
                { "@idOrden", idOrden }
            };

            return _operacion.EjecutarSentencia(sentencia, parametros) > 0;
        }
        
        public DataTable ObtenerOrdenesPendientesSinMesa()
        {
            DataTable ordenPendiente = new DataTable();
            string consulta = @"SELECT idOrden, estadoOrden, clienteOrden, fechaOrden, tipoOrden, idMesa, comentarioOrden  
                                FROM RG_Orden
                                WHERE estadoOrden = 'Pendiente'
                                AND idMesa IS NULL;";

            try
            {
                ordenPendiente = _operacion.Consultar(consulta);

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener las ordenes pendientes sin mesa: " + ex.Message);
            }

            return ordenPendiente;
        }


        public DataTable ObtenerOrdenesPendientesConMesa()
        {
            DataTable ordenPendiente = new DataTable();
            string consulta = @"SELECT ord.idOrden, ord.estadoOrden, ord.clienteOrden, ord.fechaOrden, ord.tipoOrden, m.numeroMesa AS idMesa, ord.comentarioOrden 
                                FROM RG_Orden ord
                                JOIN RG_Mesa m ON m.idMesa = ord.idMesa
                                WHERE estadoOrden = 'Pendiente';";

            try
            {
                ordenPendiente = _operacion.Consultar(consulta);

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al obtener las ordenes pendientes con mesa: " + ex.Message);
            }

            return ordenPendiente;
        }

    }
}
