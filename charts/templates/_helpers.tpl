
{{- define "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.fullname" -}}
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


{{- define "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.labels" -}}
helm.sh/chart: {{ include "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.chart" . }}
{{ include "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo75120b76-3000-4a7d-b1e7-a2142905071e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}