
{{- define "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.fullname" -}}
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


{{- define "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.labels" -}}
helm.sh/chart: {{ include "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.chart" . }}
{{ include "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0076ecb-2de6-44b9-b03a-dbcede73cacf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}