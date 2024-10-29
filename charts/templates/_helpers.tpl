
{{- define "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.fullname" -}}
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


{{- define "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.labels" -}}
helm.sh/chart: {{ include "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.chart" . }}
{{ include "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo43b0f2ff-084f-4b43-ba2e-76c0251c79cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}