
{{- define "go-echoc095473b-6589-457b-a1ef-9f270706df5a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc095473b-6589-457b-a1ef-9f270706df5a.fullname" -}}
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


{{- define "go-echoc095473b-6589-457b-a1ef-9f270706df5a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc095473b-6589-457b-a1ef-9f270706df5a.labels" -}}
helm.sh/chart: {{ include "go-echoc095473b-6589-457b-a1ef-9f270706df5a.chart" . }}
{{ include "go-echoc095473b-6589-457b-a1ef-9f270706df5a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc095473b-6589-457b-a1ef-9f270706df5a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc095473b-6589-457b-a1ef-9f270706df5a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}