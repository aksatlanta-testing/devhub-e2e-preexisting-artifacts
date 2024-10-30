
{{- define "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.fullname" -}}
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


{{- define "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.labels" -}}
helm.sh/chart: {{ include "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.chart" . }}
{{ include "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae311548-54c4-43e7-8ff7-64ec501ceeda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}