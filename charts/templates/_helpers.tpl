
{{- define "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.fullname" -}}
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


{{- define "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.labels" -}}
helm.sh/chart: {{ include "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.chart" . }}
{{ include "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd7352a7-fb19-433d-8b35-861e4f7dc4ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}