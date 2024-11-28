
{{- define "go-echob1a15c79-d760-473c-a956-1b772d384032.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1a15c79-d760-473c-a956-1b772d384032.fullname" -}}
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


{{- define "go-echob1a15c79-d760-473c-a956-1b772d384032.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1a15c79-d760-473c-a956-1b772d384032.labels" -}}
helm.sh/chart: {{ include "go-echob1a15c79-d760-473c-a956-1b772d384032.chart" . }}
{{ include "go-echob1a15c79-d760-473c-a956-1b772d384032.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1a15c79-d760-473c-a956-1b772d384032.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1a15c79-d760-473c-a956-1b772d384032.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}