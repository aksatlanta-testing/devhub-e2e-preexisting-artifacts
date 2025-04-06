
{{- define "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.fullname" -}}
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


{{- define "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.labels" -}}
helm.sh/chart: {{ include "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.chart" . }}
{{ include "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo923edf8e-10f2-4526-90b6-2cb5cc64434a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}