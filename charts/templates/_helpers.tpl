
{{- define "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.fullname" -}}
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


{{- define "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.labels" -}}
helm.sh/chart: {{ include "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.chart" . }}
{{ include "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob262f0da-3e57-48cd-a5ed-891d121dc4be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}