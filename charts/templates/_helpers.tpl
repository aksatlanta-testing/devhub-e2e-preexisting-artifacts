
{{- define "go-echob76992b7-35b9-4901-abe4-03583fbacafc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob76992b7-35b9-4901-abe4-03583fbacafc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob76992b7-35b9-4901-abe4-03583fbacafc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob76992b7-35b9-4901-abe4-03583fbacafc.labels" -}}
helm.sh/chart: {{ include "go-echob76992b7-35b9-4901-abe4-03583fbacafc.chart" . }}
{{ include "go-echob76992b7-35b9-4901-abe4-03583fbacafc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob76992b7-35b9-4901-abe4-03583fbacafc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob76992b7-35b9-4901-abe4-03583fbacafc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}