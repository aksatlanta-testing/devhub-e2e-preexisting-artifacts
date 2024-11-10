
{{- define "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.fullname" -}}
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


{{- define "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.labels" -}}
helm.sh/chart: {{ include "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.chart" . }}
{{ include "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodafc5ce4-08a3-4cb7-b9c8-b173fc6cbfb4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}